import React from "react";
import { vi } from "vitest";

type LinkProps = {
  href: string | URL;
  children: React.ReactNode;
  className?: string;
} & Record<string, unknown>;

vi.mock("next/link", () => {
  return {
    __esModule: true,
    default: ({ href, children, ...rest }: LinkProps) => {
      const normalizedHref = typeof href === "string" ? href : href.toString();
      return React.createElement("a", { href: normalizedHref, ...rest }, children);
    },
  };
});

vi.mock("next/navigation", () => ({
  useRouter: () => ({
    push: vi.fn(),
    replace: vi.fn(),
    prefetch: vi.fn(),
  }),
}));
