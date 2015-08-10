require 'defines'

--times per second (max 60) that logistic combinators will poll the logistic network for values.
--haven't doen any large-scale testing, but polling too frequently, when you have lots of these,
--may cause performance issues in worlds. you can dial it to 60 (instant refresh) if you want, or
--dial it down to once a second or lower if you don't need it to be responsive and want to avoid
--performance issues.
logistic_polling_rate = 5
