# KingMe

*A platform for exploring, training, and competing using GPS data for bicycling*

# Motivation

Other ride-tracking services exist, but they fall short in a few ways:
- When you ride a lot, you want to ride different routes. Most sites 
  provide route building services, but this is time consuming. KingMe
  uses [Route Grower](github.com/ftrimble/route-grower) to provide automated
  route generation. Eventually, this will leverage heat map data, segment
  popularity, road conditions, etc., but right now it is pretty minimal. Also,
  we'll show popular routes in your area.
- Strava provides passive and generalized competition via segments, but there
  is no way to specifically throw down against your best mates. KingMe will
  use challenges to answer the question of who is really faster. These will
  involve multi-day exercises to compare mileage, heart rate, power, elevation
  gain, segment performance, etc., without needing to be physically colocated.
- Getting a Garmin is expensive. Using your phone doesn't work very well
  because of battery constraints. KingMe will attempt to improve the phone
  experience by leveraging its processing power but offloading the display elsewhere.

# Contributors
- Forest Trimble
- Stephen Perkins
- Stephen Silber
- Sam Rhody
