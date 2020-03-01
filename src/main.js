const { Elm } = require("./Main.elm");
import "css-wipe";
import "./main.scss";

const app = Elm.Main.init({ node: document.getElementById("main") });
