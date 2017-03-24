
(cl:in-package :asdf)

(defsystem "mouse_reader-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Key" :depends-on ("_package_Key"))
    (:file "_package_Key" :depends-on ("_package"))
    (:file "Mouse" :depends-on ("_package_Mouse"))
    (:file "_package_Mouse" :depends-on ("_package"))
  ))