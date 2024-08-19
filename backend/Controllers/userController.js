const userModel = require("../Models/userModel");
const bcrypt = require("bcrypt");
const validator = require("validator");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const createToken = (_id) => {
  const jwtKey = "process.env.JWT_SECRET;";

  return jwt.sign({ _id }, jwtKey, { expiresIn: "3d" });
};

const registerUser = async (req, res) => {
  try {
    console.log("req.body", req.body);
    const { name, email, password, gender, country, birthday, interests } =
      req.body;

    let user = await userModel.findOne({ email });
    if (user) {
      return res.status(400).json("User with the given email already exists");
    }

    if (!name || !email || !password) {
      return res.status(400).json("All fields are required");
    }

    if (!validator.isEmail(email)) {
      return res.status(400).json("Email must be a valid email");
    }
    if (!validator.isStrongPassword(password)) {
      return res.status(400).json("Password must be a strong password");
    }

    user = new userModel({
      name,
      email,
      password,
      gender,
      country,
      birthday,
      interests,
    });

    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(user.password, salt);

    await user.save();

    const token = createToken(user._id);

    res.status(200).json({
      _id: user._id,
      name,
      gender,
      email,
      country,
      birthday,
      interests,
      token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json("Server Error");
  }
};

const loginUser = async (req, res) => {
  const { email, password } = req.body;
  try {
    let user = await userModel.findOne({ email });
    if (!user) return res.status(400).json("Invalid email or password");

    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword)
      return res.status(400).json("Invalid email or password");

    const token = createToken(user._id);

    res.status(200).json({
      _id: user._id,
      name: user.name,
      email: user.email,
      gender: user.gender,
      country: user.country,
      birthday: user.birthday,
      interests: user.interests,
      token: token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json("Server Error");
  }
};

const findUser = async (req, res) => {
  const userId = req.params.userId;
  try {
    const user = await userModel.findById(userId);
    //  const {password,...userWithoutPass} = user;
    res.status(200).json(user);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
};

const getUsers = async (req, res) => {
  try {
    const users = await userModel.find();
    res.status(200).json(users);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
};

const updateInterests = async (req, res) => {
  const { userId } = req.params;
  const { interests } = req.body;

  try {
    if (!Array.isArray(interests)) {
      return res.status(400).json("Interests must be an array of strings");
    }

    const user = await userModel.findByIdAndUpdate(
      userId,
      { interests },
      { new: true, runValidators: true } // Returns the updated document and applies validators
    );

    if (!user) {
      return res.status(404).json("User not found");
    }

    res.status(200).json(user);
  } catch (error) {
    console.log(error);
    res.status(500).json(error.message);
  }
};
module.exports = {
  registerUser,
  loginUser,
  findUser,
  getUsers,
  updateInterests,
};
