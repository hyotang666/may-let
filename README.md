# MAY-LET 0.0.0
## What is this?
Local variable without initialization.
If refer before asign, an error is signaled.

## Alternatives and differences.
Please tell me if exists.

## Usage
Syntax is same with `CL:LET`.
But if VAR is not initialized, and refer it before asigned, an error is signaled.

```lisp
(may-let (a) a) => error
```

NOTE: BIND without init-form is never signals.

```lisp
(may-let ((a)) a) => NIL
```

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

## Installation

