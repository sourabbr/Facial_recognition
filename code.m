load('dataEmmaWill.mat');
X=data(:,1:10000);
y=data(:,10001);
X=double(X);
y=double(y);
 input_layer_size  = 10000;
hidden_layer_size = 25;   % 25 hidden units
num_labels = 1;
m = size(X, 1);

sel = randperm(size(X, 1));
sel = sel(:);
displayData(X(sel, :));
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
lambda = 0;
J = nnCostFunction(initial_nn_params, input_layer_size, hidden_layer_size, ...
num_labels, X, y, lambda);
 options = optimset('MaxIter',500);

lambda = 1;

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
displayData(Theta1(:, 2:end));
pred = predict(Theta1, Theta2, X);
if(pred==1)
    fprintf('\nWill Smith\n');
else
    fprintf('Emma Watson\n');
end
    
    
    
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

