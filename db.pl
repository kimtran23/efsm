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
