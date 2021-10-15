(in-package :cl-user)

(defpackage :may-let
  (:use :cl)
  (:export #:may-let))

(in-package :may-let)

(defmacro may-let ((&rest bind*) &body body)
  (let ((vars
         (loop :for bind :in bind*
               :collect (and (symbolp bind) (gensym)))))
    `(let ,(loop :for bind :in bind*
                 :for var :in vars
                 :when var
                   :collect `(,var
                              (lambda ()
                                (error "~S is not initialized yet." ',bind)))
                 :else
                   :collect (progn
                             #+allegro
                             (assert (<= 0 (length bind) 2))
                             bind))
       (flet ,(loop :for var :in vars
                    :when var
                      :collect `(,var nil (funcall ,var))
                      :and :collect `((setf ,var) (new)
                                      (setq ,var (lambda () new)) new))
         (symbol-macrolet ,(loop :for var :in vars
                                 :for bind :in bind*
                                 :when var
                                   :collect `(,bind (,var)))
           ,@body)))))
