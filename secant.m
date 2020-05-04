function c = secant(x0, x1, delta)
%% Math 464   Autumn 06
%% 	
%% Remember that the function statement must be at the top of 
%% your m-file! Comments come after the function statement.
%%
%%
%% secant.m
%% 
%% Implements the secant method
%%
%% Input: 	x0	initial guess for the root of f
%%              x1      another initial guess for the root of f
%% 		delta	the tolerance/accuracy we desire
%% 
%% Output:	c 	the approxmiation to the root of f
%% 
%% Syntax:	secant(x0, x1, delta)
%%
%% Notes:  
%% 		1. Don't use eps as a variable.  eps is an internal
%% 			MATLAB routine in some versions of MATLAB.
%%		2. The code defining f comes after the code 
%%			defining secant, since secant depends on f.
%%		3. By default, MATLAB only displays 5 digits.  You can
%%			change this by issuing the command "format long e".
%%			See "help format" for more details.
%%
format long e

fx0 = f(x0);                   
fx1 = f(x1);                   
if abs(fx1) < abs(fx0),         %% c is the current best approx to a root.
  c = x1;  fc = fx1;
else
  c = x0;  fc = fx0;
end;
fprintf('initial guesses: x0=%d, x1=%d, fx0=%d, fx1=%d\n',x0,x1,fx0,fx1)
if abs(fc) <= delta             %% check to see if initial guess satisfies
  return;                       %% convergence criterion.                      
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                       %%
%% main routine                                                          %%
%%                                                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while abs(fc) > delta,
  fpc = (fx1-fx0)/(x1-x0);      %% this is the secant approx to f'.

  if fpc==0,                    %% if fprime is 0, abort.
    error('fprime is 0')        %% the error function prints message and exits
  end;

  x0 = x1;  fx0 = fx1;             %% save previous iterate
  x1 = x1 - fx1/fpc;               %% secant step
  fx1 = f(x1);
  if abs(fx1) < abs(fx0),          %% store best approx to root in c.
    c = x1;  fc = fx1;
  else
    c = x0;  fc = fx0;
  end;
  fprintf('   x0=%d, x1=%d, fx0=%d, fx1=%d\n',x0,x1,fx0,fx1)
end;
%%
%% put subroutines here
%%
%%
function fx = f(x)
	fx = (5-x)*exp(x) - 5;
	return;