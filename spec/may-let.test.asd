; vim: ft=lisp et
(in-package :asdf)
(defsystem "may-let.test"
  :version
  "0.1.0"
  :depends-on
  (:jingoh "may-let")
  :components
  ((:file "may-let"))
  :perform
  (test-op (o c) (declare (special args))
   (apply #'symbol-call :jingoh :examine :may-let args)))
