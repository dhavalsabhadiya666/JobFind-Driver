enum APIType { aGet, aPost, aPut, aDelete }
enum APIHeaderType {
  fileUploadWithToken,
  fileUploadWithoutToken,
  jsonBodyWithToken,
  onlyToken
}

enum Status { INITIAL, LOADING, COMPLETE, ERROR }

enum CardType {
  Master,
  Visa,
  Verve,
  AmericanExpress,
  Discover,
  DinersClub,
  Jcb,
  Others,
  Invalid
}
