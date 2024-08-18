const express = require("express");
const {
  registerUser,
  loginUser,
  findUser,
  getUsers,
  updateInterests,
} = require("../Controllers/userController");
const router = express.Router();

router.post("/register", registerUser);
router.post("/login", loginUser);
router.get("/find/:userId", findUser);
router.get("/", getUsers);
router.put("/:userId/interests", updateInterests);
module.exports = router;
