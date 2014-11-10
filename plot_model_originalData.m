function plot_model_originalData(mdl, x_original, y_original, description)
%% TODO: IMPLEMENT THIS.
% Plot the original data points and the fitted linear model. 
% Make sure that you include all information necessary to understand the graph.
% Give the exact form of the model (with values for a and b) in the title.
%
% Input: mdl, LinearModel. 
%        A linear model. Use the 'predict' function to predict the response
%        data necessary for plotting the model.
%        
%        x_original, 1xN array.
%        The original independent variable.
%
%        y_original, 1xN array.
%        The original response data.
%
%        description, string.
%        A description that specifies the data (e.g. effective ID). Could
%        for example be used in the title of the plot.
%

    plot(x_original, y_original, '*')
    hold on
    y_predicted = predict(mdl, x_original');
    plot(x_original, y_predicted)
    legend('original data', 'predicted data', 'Location', 'northwest')
    title(description)
    hold off

end