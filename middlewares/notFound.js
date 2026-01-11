function notFound(req, res, next){
  res.status(404).json({
    error: "Not found",
    message: "Cannot found the path you're searching"
  })
}

module.exports = notFound;