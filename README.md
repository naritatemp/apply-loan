1. To create simple endpoint and front end, 
	- I used ruby light framework Sinatra instead of RoR for quick implementation, because there is no relations or models.

2. For frontend,
	- input .. personal code, loan amount, loan period
	- it can choose only from constrains range.
	- For user having debt, return debt error page as a result.
	- one's personal code should not be seen to others, but used pull down for ease here.

3. For logic,
	- maximum loan is calculated by ```maximum = modifier*period```
	- By above maximum value, decide if it approves or not.
	- if max loan is over limit, period should be shorter.
	case1: 60month*1000modi = 60000 -> over max 10000, so it returns 10 month
	- if max loan is less than limit, period should be longer.
	case2: 12month*100modi = 1200 -> less than min 2000, so it returns 20 months
	- I should separate the logic code from route setting, but I wrote in route for quick implementation here.

4. how to check and run this code.
```
cd apply-loan
# install sinatra and puma.
gem install sinatra
gem install puma
# run 
ruby route.rb
# in browser, check http://localhost:4567/
```