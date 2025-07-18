import { PrismaClient } from "@prisma/client";
import NotFoundError from "../../errors/NotFoundError.js";

const getOrdersByUserId = async (userId) => {
  const prisma = new PrismaClient();
  const orders = await prisma.order.findMany({
    where: { user_id: userId },
    include: { book: true, record: true },
  });

  if (orders.length === 0) {
    throw new NotFoundError("Orders for user", userId);
  }
  return orders;
};

export default getOrdersByUserId;
