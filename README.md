# MAY-LET 0.0.0
## What is this?
Local version of the cl:defvar.

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

### Product's goal

### License

### Developed with

### Tested with

## Installation

