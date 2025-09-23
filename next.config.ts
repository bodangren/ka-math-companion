import type { NextConfig } from "next";
import createMDX from "@next/mdx";

const withMDX = createMDX({
  extension: /\.mdx?$/,
  options: {
    remarkPlugins: [],
    rehypePlugins: [],
  },
});

const nextConfig: NextConfig = {
  output: "export",
  trailingSlash: true,
  pageExtensions: ["tsx", "ts", "mdx"],
  images: {
    unoptimized: true,
  },
  typedRoutes: true,
};

export default withMDX(nextConfig);
