%% Part I: Overall EFSM
state(dormant). 
state(init).
state(idle).
state(monitoring).
state(error_diagnosis).
state(safe_shutdown).
%%start(dormant).

%% transition(SourceState, DestinationSate, Event, Guard, Action).
transition(dormant, init, start, no_guard, no_action). 
transition(init, idle, init_ok, 'drivers loaded', no_action).
transition(init, error_diagnosis, init_crash, no_guard, ['information logged', init_err_msg]).
transition(idle, monitoring, begin_monitoring, no_guard, no_action).
transition(idle, error_diagnosis, idle_crash, no_guard, idle_err_msg).
transition(monitoring, error_diagnosis, monitor_crash, no_guard, moni_err_msg). 
transition(error_diagnosis, idle, idle_rescue, no_guard, no_action).
transition(error_diagnosis, monitoring, moni_rescue, no_guard, no_action).
transition(error_diagnosis, safe_shutdown, shutdown, 'retry >= 3', no_action).
transition(error_diagnosis, init, [retry_init, 'incr retry by 1'], 'retry < 3', no_action). 
transition(safe_shutdown, dormant, sleep, no_guard, no_action).
transition(dormant, exit, kill, no_guard, no_action).

%% Part II: Refine init

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
