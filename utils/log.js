import winston from "winston";

// create a new logger:
const logger = winston.createLogger({
  level: "info", //the logger will log all msgs with severity of 'info' and above.
  format: winston.format.json(), // all log msgs output will be json
  defaultMeta: { service: "bookstore-api" }, // every log msg will include the service name in its metadata
});

// checking if the app is running in a production environment or not:
if (process.env.NODE_ENV !== "production") {
  // if it's running in dev or testing environment:
  logger.add(
    // stores the log in console in a human-readable format:
    new winston.transports.Console({ format: winston.format.simple() })
  );
}

export default logger;
