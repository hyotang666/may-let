; vim: ft=lisp et
(in-package :asdf)
(defsystem "may-let"
  :version
  "1.0.2"
  :author "SATO Shinichi"
  :license "Public domain"
  :description "Local variable without initialization. If refer before asign, an error is signaled."
  :depends-on
  nil
  :pathname
  "src/"
  :components
  ((:file "may-let")))

;;; These forms below are added by JINGOH.GENERATOR.
;; Ensure in ASDF for pretty printings.
(in-package :asdf)
;; Enable testing via (asdf:test-system "may-let").
(defmethod component-depends-on ((o test-op) (c (eql (find-system "may-let"))))
  (append (call-next-method) '((test-op "may-let.test"))))
;; Enable passing parameter for JINGOH:EXAMINER via ASDF:TEST-SYSTEM.
(defmethod operate :around
           ((o test-op) (c (eql (find-system "may-let")))
            &rest keys
            &key ((:compile-print *compile-print*))
            ((:compile-verbose *compile-verbose*)) &allow-other-keys)
  (flet ((jingoh.args (keys)
           (loop :for (key value) :on keys :by #'cddr
                 :when (find key '(:on-fails :subject :vivid) :test #'eq)
                 :collect key
                 :and
                 :collect value :else
                 :when (eq :jingoh.verbose key)
                 :collect :verbose
                 :and
                 :collect value)))
    (let ((args (jingoh.args keys)))
      (declare (special args))
      (call-next-method))))
