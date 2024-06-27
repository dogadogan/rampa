
(cl:in-package :asdf)

(defsystem "ur10_mover-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ListOfPoses" :depends-on ("_package_ListOfPoses"))
    (:file "_package_ListOfPoses" :depends-on ("_package"))
  ))