#routes
module.exports.index = (req, res) ->
  res.render 'index.jade', {title: 'home'}
