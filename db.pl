%% Part I: Overall EFSM
state(dormant). 
state(init).
state(idle).
state(monitoring).
state(error_diagnosis).
state(safe_shutdown).
%%start(dormant).
%%final(dormant).

%% transition(SourceState, DestinationSate, Event, Guard, Action).


%% Part II: Refine init
state(boot_hw).
state(senchk).
state(tchk).
state(psichk).
state(ready).
%%start(boot_hw).

%%superstate(init, boot_hw).
%%superstate(init, senchk).
%%superstate(init, tchk).
%%superstate(init, psichk).
%%superstate(init, ready).

%% transition(SourceState, DestinationSate, Event, Guard, Action).
transition(boot_hw, senchk, hw_ok, no_guard, no_action).
transition(senchk, tchk, senok, no_guard, no_action).
transition(tchk, psichk, psi_ok, no_guard, no_action).
transition(psichk, ready, psi_ok, no_guard, no_action).

%% Part V: Refine error diagnosis (robust error handling)
state(error_rcv).
state(applicable_rescue).
state(reset_module_data).
%%start(error_rcv).

%%superstate(error_diagnosis, error_rcv).
%%superstate(error_diagnosis, applicable_rescue).
%%superstate(error_diagnosis, reset_module_data).

%% transition(SourceState, DestinationSate, Event, Guard, Action).
transition(error_rcv, applicable_rescue, no_event, 'err_protocol_def == true', no_action).
transition(error_rcv, reset_module_data, no_event, 'err_protocol_def == false', no_action).
transition(applicable_rescue, exit, apply_protocol_rescues, no_guard, no_action).
transition(reset_module_data, exit, reset_to_stable, no_guard, no_action).

%% Part VI: Simulating your machine
is_loop(Event, Guard).
all_loops(Set).
is_edge(Event, Guard).
size(Length).
is_link(Event, Guard).
all_superstates(Set).
ancestor(Ancestor, Descendant).
inherits_transitions(State, List).
all_states(L).
all_init_states(L).
get_starting_state(State).
state_is_reflexive(State).
graph_is_reflexive.
get_guards(Ret).
get_event(Ret).
get_actions(Ret).
get_only_guarded(Ret).
legal_events_of(State, L).
