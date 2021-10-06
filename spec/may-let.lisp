(defpackage :may-let.spec
  (:use :cl :jingoh :may-let))
(in-package :may-let.spec)
(setup :may-let)

(requirements-about MAY-LET :doc-type function)

;;;; Description:

#+syntax (MAY-LET (&rest bind*) &body body) ; => result

;;;; Arguments and Values:

; bind* := [ var | (var init-form?) ]
; var := symbol, otherwise implementation dependent condition.
#?(may-let ("not symbol")) :signals condition
#?(may-let (("not symbol"))) :signals condition

; When INIT-FORM exists, VAR is initialized by such form.
#?(may-let ((a :init-form)) a) => :init-form
; If INIT-FORM is not exists, VAR is bound by NIL.
#?(may-let ((a)) a) => NIL
; If BIND is symbol, such var is not initialized.
#?(may-let (a) a) :signals error
,:lazy t
; After asigned, it works.
#?(may-let (a) (setq a 0) a) => 0

; body := implicit progn.

; result := The result of BODY.

;;;; Affected By:
; none

;;;; Side-Effects:
; none

;;;; Notes:

;;;; Exceptional-Situations:
; If BIND has two or more INIT-FORMs, an error is signeled.
#?(may-let ((a :init-form :and-more)) a) :signals condition
