# MAY-LET 0.0.0
## What is this?
Local variable without initialization.
If refer before assign, an error is signaled.

## Alternatives and differences.
Please tell me if exists.

## Usage
The syntax is the same with `CL:LET`.
But if VAR is not initialized, and refer it before assigned, an error is signaled.

```lisp
(may-let (a) a) => error
```

NOTE: BIND without init-form is never signals.

```lisp
(may-let ((a)) a) => NIL
```

## Usecase.

The scope of the variable should be narrow.
Typical code is like below.

```lisp
(if (outer-pred)
    (do-a)
    (let ((var (initialize)))
      (if (inner-pred var)
          (do-b var)
          (do-c))))
```

The nest is deep.
To make nest shallow, we need to bubble up the variable.

```lisp
(let ((var (initialize)))
  (cond
    ((outer-pred) (do-a))
    ((inner-pred var) (do-b var))
    (t (do-c))))
```

Issues are

* scope of the variable becomes wide.
* If `OUTER-PRED` is `T`, the result of `INITIALIZE` is just discarded.

To delay `INITIALIZE`, the code becomes like below.

```lisp
(let (var)
  (cond
    ((outer-pred) (do-a))
    ((inner-pred (setq var (initialize)))
     (do-b var))
    (t (do-c))))
```

The variable without initialization is not healthy.
I want to get warnings if referring to the variable before assigning.

may-let fits such a situation.

```lisp
(may-let (var)
  (cond
    ((outer-pred) (do-a))
    ((inner-pred (setq var (initialize)))
     (do-b var))
    (t (do-c))))
```
When referring to the variable before assigning, the compiler may claims (the message is hard to understand though).
Even if the compiler does nothing, an error is signaled in runtime.

`MAY-LET` has almost the same syntax as `CL:LET`, so after development, you can safely replace it.

## From developer
### TODO
* Support DECLARE.
* Support LET\*.

### Product's goal

### License
Public domain.

### Developed with
SBCL

### Tested with
* SBCL/2.1.7
* CCL/1.12.1
* ECL/21.2.1
* CLISP/2.49
* Allegro/10.1
* CMUCL/21D
* ABCL/1.8.0

## Installation

