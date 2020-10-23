open User 
open Restaurant 
open Groups


(**The state of the app at any given point, containing information about all users, groups, and restaurants*)

type t

type user_id
type group_id

open Yojson.Basic.Util
(**The state of the app at any given point, containing information about
   all users, groups, and restaurants*)

type t 

(** Returns id of user about to be added *)
val add_user : string -> string -> string -> unit 

(**Returns group list user about to be added *)
val join_group : group_id -> user_id -> unit
