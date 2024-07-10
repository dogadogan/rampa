
(cl:in-package :asdf)

(defsystem "ur10_mover-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :moveit_msgs-msg
               :ur10_mover-msg
)
  :components ((:file "_package")
    (:file "DiscardService" :depends-on ("_package_DiscardService"))
    (:file "_package_DiscardService" :depends-on ("_package"))
    (:file "ExecutionService" :depends-on ("_package_ExecutionService"))
    (:file "_package_ExecutionService" :depends-on ("_package"))
    (:file "GetTrainingDataService" :depends-on ("_package_GetTrainingDataService"))
    (:file "_package_GetTrainingDataService" :depends-on ("_package"))
    (:file "GripperService" :depends-on ("_package_GripperService"))
    (:file "_package_GripperService" :depends-on ("_package"))
    (:file "PlannerService" :depends-on ("_package_PlannerService"))
    (:file "_package_PlannerService" :depends-on ("_package"))
    (:file "SampleService" :depends-on ("_package_SampleService"))
    (:file "_package_SampleService" :depends-on ("_package"))
    (:file "StateService" :depends-on ("_package_StateService"))
    (:file "_package_StateService" :depends-on ("_package"))
    (:file "TrainingDataService" :depends-on ("_package_TrainingDataService"))
    (:file "_package_TrainingDataService" :depends-on ("_package"))
    (:file "TrainingService" :depends-on ("_package_TrainingService"))
    (:file "_package_TrainingService" :depends-on ("_package"))
  ))