// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BlackoutController from "./blackout_controller"
application.register("blackout", BlackoutController)

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import ExternalController from "./external_controller"
application.register("external", ExternalController)

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NewProfileController from "./new_profile_controller"
application.register("new-profile", NewProfileController)

import PreviewController from "./preview_controller"
application.register("preview", PreviewController)

import ProfpreviewController from "./profpreview_controller"
application.register("profpreview", ProfpreviewController)

import SwitchSearchController from "./switch_search_controller"
application.register("switch-search", SwitchSearchController)
