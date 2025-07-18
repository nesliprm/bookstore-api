import { Router } from "express";
import notFoundErrorHandler from "../middleware/notFoundErrorHandler.js";
import getOrdersByUserId from "../services/users/getUserOrders.js";

const router = Router();

router.get(
  "/:id/orders",
  async (req, res, next) => {
    try {
      const { id } = req.params;
      const userOrders = await getOrdersByUserId(id);

      res.status(200).json(userOrders);
    } catch (error) {
      next(error);
    }
  },
  notFoundErrorHandler
);

export default router;
