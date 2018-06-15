reverse([],[]).    % the empty list is its own reverse. Base for induction.
reverse([H|T], Rev) :-reverse(T, Trev), append(Trev, [H], Rev).
