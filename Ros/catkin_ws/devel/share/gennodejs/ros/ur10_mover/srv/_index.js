
"use strict";

let GripperService = require('./GripperService.js')
let DiscardService = require('./DiscardService.js')
let GetTrainingDataService = require('./GetTrainingDataService.js')
let ExecutionService = require('./ExecutionService.js')
let TrainingDataService = require('./TrainingDataService.js')
let TrainingService = require('./TrainingService.js')
let SampleService = require('./SampleService.js')
let StateService = require('./StateService.js')
let PlannerService = require('./PlannerService.js')

module.exports = {
  GripperService: GripperService,
  DiscardService: DiscardService,
  GetTrainingDataService: GetTrainingDataService,
  ExecutionService: ExecutionService,
  TrainingDataService: TrainingDataService,
  TrainingService: TrainingService,
  SampleService: SampleService,
  StateService: StateService,
  PlannerService: PlannerService,
};
