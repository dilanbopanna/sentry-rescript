const webpack = require("webpack");
const path = require("path");
const tailwindcss = require("tailwindcss");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CopyPlugin = require("copy-webpack-plugin");

let repoVersion = require("./package.json").version;
let repoName = require("./package.json").name;

module.exports = (publicPath = "auto") => {
    let entries = {
        app: "./index.js",
    };
    return {
        mode: "development",
        output: {
            path: path.resolve(__dirname, "dist"),
            clean: true,
            publicPath: "/",
        },
        optimization: {
            minimize: false,
        },

        devServer: {
            contentBase: path.join(__dirname, "dist"),
            compress: true,
            hot: true,
            port: 9000,
            historyApiFallback: true,
            proxy: {},
        },
        plugins: [
            new MiniCssExtractPlugin(),
            new CopyPlugin({
                patterns: [{ from: "public" }],
            }),
            new webpack.DefinePlugin({
                repoName: JSON.stringify(repoName),
                repoVersion: JSON.stringify(repoVersion),
            }),
            // new webpack.HTMLInjectPlugin({
            //   publicPath: JSON.stringify(repoVersion),
            // }),
        ],
        module: {
            rules: [
                {
                    test: /\.css$/i,
                    use: [
                        MiniCssExtractPlugin.loader,
                        "css-loader",
                        {
                            loader: "postcss-loader",
                            options: {
                                postcssOptions: {
                                    plugins: [[tailwindcss("./tailwind.config.js")]],
                                },
                            },
                        },
                    ],
                },
            ],
        },
        entry: entries,
    };
};
