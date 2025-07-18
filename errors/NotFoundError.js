class NotFoundError extends Error {
  constructor(type, id) {
    super(`${type} with id ${id} was not found!`);
    this.name = "NotFoundError";
  }
}

export default NotFoundError;
