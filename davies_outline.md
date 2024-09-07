# Davies Outline for The Book of R

## Chapter 1 : Getting Started

 * Obtaining and Installing R from CRAN  
 * Opening R for the First Time   
   - Console and Editor Panes   
   - Comments 
   - Working Directory 
   - Installing and Loading R Packages 
   - Help Files and Function Documentation   
   - Third-Party Editors 
 * Saving Work and Exiting R  
   - Workspaces
   - Scripts  
 * Conventions  
   - Coding  
   - Math and Equation References  
   - Exercises


## Chapter 2: Numeric, Arithmetic, Assignment, and Vectors

 * R for Basic Math
   - Arithmetic
   - Logarithms and Exponentials
   - E-notation 
 * Assigning Objects
 * Vectors
   - Creating a Vector
   - Sequences, Repetition, Sorting, and Lengths
   - Subsetting and Element Extraction 
   - Vector-Oriented Behavior 


## Chapter 3: Matrices and Arrays
 * Defining a Matrix
   - Filling Direction
   - Row and Column Bindings
   - Matrix Dimensions
 * Subsetting
   - Row, column, and diagonal extraction
   - Omitting and Overwriting
 * Matrix Operations and Algebra
   - Matrix Transpose
   - Identity Matrix
   - Scalar Multiple of a Matrix
   - Matrix Addition and Subtraction
   - Matrix Multiplication
   - Matrix Inversion
 * Multidimensional Arrays
   - Definition
   - Subsets, Extraction, and Replacements


## Chapter 4: Non Numeric Value
 * Logical Values
   - TRUE or FALSE?
   - A Logical Outcome: Relational Operators
   - Multiple Comparisons: Logical Operators
   - Logicals are Numbers!
   - Logical Subsetting and Extraction
 * Characters
   - Creating a String
   - Concatenation
   - Escape Sequences
   - Substrings and Matching
 * Factors
   - Identifying Categories
   - Defining and Ordering Levels
   - Combining and Cutting


## Chapter 5: Lists and Data Frames

 * Lists of Objects
   - Definition and Component Access
   - Naming
   - Nesting 
 * Data frames
   - Construction
   - Adding Data Columns and Combining Data Frames


## Chapter 6: Special Values, Classes, Coercion

 * Some Special Values 
   - Infinity
   - NaN 
   - NA
   - NULL
 * Understanding Types, Classes, and Coercion
   - Attributes 
   - Objects
   - Is-Dot Object Checking Functions
   - As-Dot Coercion Function

## Chapter 7: Basic Plotting 

 * Using plot with Coordinate Vectors
 * Graphical Parameters
   - Automated Plot Types 
   - Title and Axis Labels
   - Color 
   - Line and Point Appearance
   - Plotting Region Limits
 * Adding Points, Lines and Text to an Exiting Plot 
 * The `ggplot2` package 
   - A quick plot with `qplot`
   - Setting Appearance Constants with Geoms
   - Aesthetic Mapping with Geoms

## Chapter 8: Reading and Writing Files

 * R Ready Data Sets
   - Built in Data sets
   - Contributed Data sets
 * Reading in External Data Files
   - The Table format
   - Spreadsheet Workbooks
   - Web-based files
   - Other file formats



## Chapter 9: Calling Function 
 * Scoping 
   - Environments
   - Search Path
   - Reserved and Protected Names
 * Argument Matching
   - Exact
   - Partial
   - Positional 
   - Mixed
   - Dot-Dot-Dot: Use of Ellipses
 
## Chapter 10: Conditions and Loops
 * `if` statements
   - Stand alone statements
   - `else` statements
   - using `ifelse` for Element-Wise checks 
   - Nesting and Stacking Statements 
 * Coding Loops 
   - `for` loops
   - `while` loops
   - Implicit Loops `apply`
 * Other Control Flow Mechanisms
   - Declaring `break` or `next`
   - The `repeat` statement 

## Chapter 11: Writing Functions
 * The `function` statements
   - Function creation
   - using `return`
 * Arguments
   - Lazy Evaluation
   - Setting Defaults
   - Checking for Missing Arguments
   - Dealing with Ellipses
 * Specialized Functions
   - Helper Functions
   - Disposable Functions
   - Recursive Functions

## Chapter 12: Exceptions, Timing, And Visibility
 * Exception Handling
   - Formal Notifications: Errors and Warnings
   - Catching errors with `try` statements
 * Progress and Timing 
   - Textual Progress Bars: Are we there yet?
   - Measuring Completion Time: How long did it take?
 * Masking 
   - Function and Object Distinction
   - Data Frame Variable Distinction


## Chapter 13: Elementary Statistics 
 * Describing Row Data
   - Numeric Variables
   - Categorical Variables
   - Univariate and Multivariate Data
 * Summary Statistics 
   - Centrality: Mean, Median, Mode
   - Counts, Percentages, and Percentages
   - Quantiles, Percentiles, and the Five-Number Summary
   - Spread: Variance, Standard Deviation, and the Interquartile Range
   - Covariance and Correlation
   - Outliers

## Chapter 14: Basic Data Visualization
 * Barplots and Pie Charts
   - Building a Barplot
   - A quick pie chart
 * Histograms
 * Box-and-Whiskers Plots
   - Stand-Alone Boxplots
   - Side by Side Boxplots
 * Scatterplots
   - Single Plot
   - Matrix of Plots

## Chapter 15: Probability
 * What is probability?
   - Events and Probability
   - Conditional Probability
   - Intersection
   - Union
   - Complement
 * Random Variables and Probability Distributions
   - Realizations
   - Discrete Random Variables
   - Continuous Random Variables
   - Slope, Skew, and Modality

## Chapter 16: Common Probability Distributions
 * Common Probability Mass Functions
   - Bernoulli Distribution
   - Binomial Distribution
   - Poisson Distribution
   - Other Mass Function
 * Common Probability Density Functions
   - Uniform
   - Normal
   - Student's t-distribution
   - Exponential
   - Other Density Function

## Chapter 17: Sampling Distributions and Confidence 
 * Sampling Distributions
   - Distribution for a Sample Mean
   - Distribution for a Sample Proportion
   - Sampling Distributions for other statistics
 * Confidence Intervals
   - An interval for a mean
   - An interval for a proportion
   - Other intervals
   - Comments on Interpretation of a CI

## Chapter 18: Hypothesis Testing 
 * Components of a Hypothesis Test
   - Hypotheses
   - Test statistics
   - p-value
   - Significance Level
   - Criticisms of hypothesis teasing
 * Testing means
   - Single Mean
   - Two means
 * Testing proportions
   - Single proportions 
   - Two proportions
 * Testing Categorical Variables
   - Single categorical variable
   - Two Categorical Variables
 * Errors and Power
   - Hypothesis Test Errors
   - Type I Errors
   - Type II Errors
   - Statistical Power

## Chapter 19: Analysis of Variance
 * One Way ANOVA
   - Hypothesis and Diagnostic checking
   - One way ANOVA Table Constructions
   - Building ANOVA Tables and the `aov` function
 * Two Way ANOVA
   - A suite of hypotheses
   - Main Effects and Interactions
 * Kruskal-Wallis Test

## Chapter 20: Simple Linear Regression
 * An Example of a Linear Relationship
 * General Concepts
   - Definition of the Model
   - Estimated the Intercept and Slope Parameters
   - Fitting Linear Models with `lm`
   - Illustrating residuals
 * Statistical Inference
   - Summarizing the Filled Models
   - Regression Coefficient Significance Tests
   - Coefficient of Determination
   - Other Summary Output
 * Understanding Categorical Predictors

## Chapter 21: Multiple Linear Regression
 * Terminology 
 * Theory
   - Extending the Simple Model to a Multiple Model
   - Estimating in Matrix form
   - A basic example
 * Implementing in R and Interpreting
   - Additional Predictors
   - Interpreting Marginal Effects
   - Visualizing the Multiple Linear Model
   - Finding confidence Intervals
   - Omnibus F-Test
   - Predicting from a Multiple Linear Model
 * Transforming Numeric Variables
   - Polynomial
   - Logarithmic 
   - Other Transformations
 * Interactive Terms
   - Concept and Motivation
   - One Categorical, One Continuous
   - Two Categorical
   - Two Continuous
   - Higher-Order Interactions


## Chapter 22: Linear Model Selection and Diagnostics
 * Goodness-of-Fit vs Complexity
   - Principle of Parsimony
   - General Guidelines
 * Model Selection Algorithms
   - Nested Comparisons: the Partial F-test
   - Forward selection
   - Backward Selection
   - Stepwise AIC Selection
   - Other Selection Algorithms
 * Residual Diagnostics
   - Inspecting and Interpreting Residuals
   - Assessing Normality
   - Illustrating outliers, leverage, and influence
   - calculating leverage
   - Cook's distance
   - Graphically combining residuals, leverage, and Cook's Distance
 * Collinearity
   - Potential Warning Signs
   - Correlated Predictors: A Quick Example



## Chapter 23: Advanced Plot Customization
 * Handling the Graphics Device
   - Manually Opening a New Device
   - Switching Between Devices
   - Closing a Device 
   - Multiple Plots in One Device
 * Plotting Regions and Margins
   - Default Spacing
   - Custom Spaces
   - Clipping
 * Point and Click Coordinate Interaction
   - Retrieving Coordinates Silently
   - Visualizing Selected Coordinates
   - Ad-Hoc Annotation
 * Customizing Traditional R Plots
   - Graphical Parameters for Style and Suppression
   - Customizing boxes
   - Customizing axes
 * Specialized Text and Label Notation
   - font
   - Greek symbols
   - Mathematical Expressions
 * A Fully Annotated Scatterplots

## Chapter 24: Going Further with the Grammar of Graphics
 * `ggplot` or `qplot`?
 * Smoothing and Shading
   - Adding LOESS Trends
   - Constructing Smooth Density Estimates
 * Multiple Plots and Variable-Mapped Facets
   - Independent Plots
   - Facets mapped to a categorical variable
 * Interactive tools in `ggvis`

## Chapter 25: Defining Colors and Plotting in Higher Dimensions
 * Representing and Using Color
   - Red-Green-Blue Hexadecimal Color Codes
   - Built-in Palettes
   - Custom Palettes
   - Using Color Palettes to Index a Continuum
   - Including a Color Legend
   - Opacity
   - RGB Alternatives and Further Functionality
 * 3D Scatterplots
   - Basic Syntax
   - Visual Enhancements
 * Preparing a Surface for Plotting
   - Constructing an Evaluation Grid
   - Constructing the z-Matrix
   - Conceptualizing the z-Matrix
 * Contour Plots
   - Drawing Contour lines
   - Color-Filled Contours
 * Pixel Images
   - One Grid Point = One Pixel
   - Surface Truncation and Empty Pixels
 * Perspective Plots






    
