function [ output_args ] = Greedy( TS, wt)
%Perform greedy algorithm (using IMGS) to form a reduced basis from a given training set.
%Inputs TS (a ndarray containing a set of normalised training vectors), wt
%(a weight, or vector of weights, for normalisation), and tol (a stopping
%criterion for the algorithm).

%stopping criterion
tol = 1e-12;

%number of training waveforms
rows = size(TS, 0);
%length of each training waveform
cols = size(TS, 1);

%setting stuff up for loop
continuework = True;
last_rb = zeros(cols);
ortho_basis = zeros(cols);
errors = zeros(rows);
A_row_norms2 = zeros(rows);
projection_norms2 = zeros(rows);
greedy_points = zeros(rows);
greedy_err = zeros(rows);

%initialse first reduced basis to zeros
RB_space = zeros(1,cols);


for i = 1:rows;
    A_row_norms2(i) = sqrt(abs(DotProduct(wt, TS(i), TS(i)))) ;
end

%initialise with the first training set
RB_space(0) = TS(0) ;
greedy_points(0) = 0;
dim_RB = 1;
greedy_err(0) = 1.0;
     
    projections = zeros(TS_size*length(TS)); 
    
while continuework
    %previous bases
    last_rb = RB_space((dim_RB)-1);

    %Compute overlaps of pieces of TS with rb_new
        for i = 1:rows
            projection_coeff = DotProduct(wt, last_rb, TS(i));
            projection_norms2(i) = projection_norms2(i) + (real(projection_coeff^2) + imag(projection_coeff^2)) 
            errors(i) = A_row_norms2(i) - projection_norms2(i);
        end
    
    %find worst represented TS element and add to basis - argmax just max?
    i = max(max(errors));
    worst_err = errors(i);
    worst_app = i;

    greedy_points(dim_RB) = worst_app
    greedy_err(dim_RB) = worst_err

    print('dim_RB', 'worst_err', 'worst_app')

    orthobasis = copy(TS(worst_app));
    orthobasis = IMGS(orthobasis, RB_space, wt)
    RB_space = vertcat(RB_space, orthobasis);

    dim_RB = dim_RB + 1;
 
%decide if another greedy sweep is needed
    if worst_err < tol 
        continuework = False;
    elseif rows == dim_RB
        continuework = False;
    end

end

%     return RB_space

end

