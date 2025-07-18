import * as Sentry from "@sentry/node";

Sentry.init({
  dsn: "https://e0d6bba643063a70896d869d442ded4c@o4509560199577600.ingest.de.sentry.io/4509560208228432",

  sendDefaultPii: true,
});
