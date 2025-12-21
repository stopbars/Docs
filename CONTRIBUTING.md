# Contributing to BARS Docs

Thank you for your interest in contributing to BARS Docs! This guide will help you get started with contributing.

BARS Docs is built using [Mintlify](https://mintlify.com/), a modern documentation platform. For detailed information on Mintlify's features and capabilities, refer to the [Mintlify Documentation](https://mintlify.com/docs).

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) v20.17.0+ (LTS versions recommended)
- [Git](https://git-scm.com/) installed and configured

### Development Setup

1. **Fork and Clone**

   ```bash
   git clone https://github.com/stopbars/docs.git
   cd docs
   ```

2. **Install the Mintlify CLI**

   ```bash
   npm i -g mint
   ```

3. **Start Development Server**

   ```bash
   mint dev
   ```

This launches a local preview at `http://localhost:3000` where you can see your changes in real-time.

## Writing Guidelines

### Style and Tone

Follow these principles when writing documentation:

- **Be concise** - Users want to achieve a goal, not read for fun. Cut unnecessary words.
- **Use active voice** - Write "Create a configuration file" instead of "A configuration file should be created."
- **Write in second person** - Use "you" to address the reader directly.
- **Be skimmable** - Use headings, lists, and short paragraphs to break up content.
- **Avoid jargon** - If technical terms are necessary, define them on first use.

For more writing tips, see [Mintlify's Style and Tone Guide](https://www.mintlify.com/guides/writing-style-tips).

### Standardised Naming Conventions

Just like ATC phraseology is standardised for clarity, BARS maintains strict naming conventions for all products, systems, and services. **Consistency is critical** - using incorrect spellings creates confusion and degrades documentation quality.

#### Required Spellings

| ✅ Correct | ❌ Incorrect Examples |
|-----------|----------------------|
| **vatSys** | VATSYS, vatsys, VatSys, VATsys, Vatsys |
| **EuroScope** | euroscope, euro scope, Euroscope, EUROSCOPE, Euro Scope |
| **Pilot Client** | pilot client, PilotClient, PILOT CLIENT, Pilotclient |
| **BARS** | bars, Bars, B.A.R.S |

> **Note:** Despite what some AIs may assume, BARS is not an acronym - it's simply the project name and doesn't stand for anything.

### Using Mintlify Components

BARS Docs leverage Mintlify's component library to create visually appealing and functional documentation. When writing guides, use appropriate components:

- **Steps** - For sequential procedures and tutorials
- **Tabs** - For platform-specific instructions
- **Callouts** (`<Note>`, `<Tip>`, `<Warning>`, `<Info>`) - For highlighting important information
- **CodeGroup** - For showing code examples in multiple languages
- **Accordions** - For collapsible supplementary content
- **Cards** - For navigation and feature highlights

Refer to the [Mintlify Components Documentation](https://mintlify.com/docs/content/components) for usage examples and syntax.

## Image Guidelines

### Image Naming Convention

All images must follow our standardised naming convention for consistency and maintainability:

```
ProductName_Type-Description
```

#### Convention Breakdown

| Part | Description | Example |
|------|-------------|---------|
| **ProductName** | The BARS product the image relates to | `vatSys`, `EuroScope`, `Pilot_Client` |
| **Type** *(optional)* | The specific feature or profile type | `INTAS`, `Legacy` |
| **Description** | What the image shows | `Windsock`, `StopbarOn`, `Toggle` |

> **Note:** The `Type` component is optional and primarily used for products with multiple feature sets or profile types (e.g., vatSys has `_INTAS` and `_Legacy` modes). Do not include "Plugin" in the naming convention - it's implied from the product name.

#### Naming Examples

**With Type (multi-feature products):**
- `vatSys_INTAS-Windsock.png` - vatSys INTAS mode, windsock indicator
- `vatSys_Legacy-Toggle.gif` - vatSys Legacy mode, toggle action

**Without Type (single-feature products):**
- `EuroScope-Network.png` - EuroScope network view
- `Pilot_Client-Config.png` - Pilot Client configuration window

### Image Folder Structure

Images are organised by documentation version in the `/images` directory:

```
images/
├── v1/          # Legacy version images (deprecated)
├── v2/          # Current version images
```

**Always add new images to the appropriate version folder**

### Media Best Practices

Following [Mintlify's media guidelines](https://www.mintlify.com/guides/media):

| Media Type | When to Use |
|------------|-------------|
| **Screenshots** | UI elements that are difficult to explain with words
| **GIFs** | Short, complex workflows or demonstrating action
| **Videos** | Abstract concepts and long tutorials

**Recommendations:**

- **Use GIFs for demonstrating actions** - When showcasing a workflow or interaction (like toggling a stopbar), GIFs are more effective than static images
- **Keep media supplementary** - If the text is clear enough, avoid adding visuals
- **Include alt text** - All images should have descriptive alt text for accessibility
- **Optimise file sizes** - Compress images to improve page load times

## Page Structure

### Frontmatter Requirements

Every `.mdx` documentation page **must** begin with YAML frontmatter:

```yaml
---
title: "Clear, Descriptive Page Title"
---
```

**Example:**

```yaml
---
title: "vatSys Plugin Installation"
---
```

### Updating docs.json

After creating new documentation pages, you **must** register them in `docs.json` for them to appear in the navigation.

#### Steps to Update Navigation

1. Open `docs.json` in the repository root
2. Locate the appropriate tab and group for your new page
3. Add the page path (without `.mdx` extension) to the `pages` array
4. Ensure the path matches your file location exactly

#### Example

If you create a new page at `vatsys/troubleshooting.mdx`, add it to the vatSys tab:

```json
{
  "tab": "vatSys Plugin",
  "groups": [
    {
      "group": "Get Started",
      "pages": [
        "vatsys/index",
        "vatsys/installation",
        "vatsys/config",
        "vatsys/troubleshooting"
      ]
    }
  ]
}
```

> **Important:** Failing to update `docs.json` will result in your new page being inaccessible through the site navigation, even though the file exists.

## Contribution Process

### 1. Create a Feature Branch

```bash
git checkout -b docs/your-change-description
# Examples:
# git checkout -b docs/add-vatsys-troubleshooting
# git checkout -b docs/fix-euroscope-typos
# git checkout -b docs/update-pilot-client-config
```

### 2. Make Your Changes

- Follow the writing guidelines and naming conventions
- Test your changes locally with `mint dev`
- Verify all links and images work correctly
- Ensure `docs.json` is updated if you added new pages

### 3. Commit Your Changes

```bash
git add .
git commit -m "docs: brief description of your changes"
```

Use descriptive commit messages:

- `docs: add vatSys INTAS troubleshooting guide`
- `docs: fix EuroScope installation instructions`
- `docs: update Pilot Client configuration options`
- `fix: correct image paths in vatSys guide`

### 4. Push and Create Pull Request

```bash
git push origin docs/your-change-description
```

Create a pull request with:

- Clear description of documentation changes
- Reference to related issues (if applicable)
- Screenshots of rendered pages for visual changes

## Common Issues

### Local Preview Not Loading

- Ensure you're running `mint dev` from the repository root
- Check that Node.js v20.17.0+ is installed: `node --version`
- Try clearing the cache: `mint clear` then `mint dev`

### Images Not Displaying

- Verify the image path starts with `/images/v2/`
- Check that the filename matches exactly (case-sensitive)
- Ensure the image was added to the correct version folder

### Page Not Appearing in Navigation

- Confirm the page is added to `docs.json`
- Verify the path in `docs.json` matches the file location (without `.mdx`)
- Restart the dev server after modifying `docs.json`

### Mintlify Components Not Rendering

- Ensure the file extension is `.mdx` (not `.md`)
- Check component syntax matches [Mintlify documentation](https://mintlify.com/docs)
- Verify all component tags are properly closed

## Getting Help

- **Discord**: Join the BARS [Discord](https://stopbars.com/discord) server for real-time help
- **GitHub Issues**: [Create an issue](https://github.com/stopbars/docs/issues/new) for bugs or feature requests
- **Mintlify Documentation** - Refer to [Mintlify Docs](https://mintlify.com/docs) for platform-specific questions

## Recognition

Contributors are recognized in:

- Release notes for significant contributions
- BARS website credits page (coming soon)
- BARS Discord Role (@Contributer)

Your contributions directly support the ongoing development and improvement of BARS. By getting involved, you help us build a more robust, and feature-rich product that benefits the entire flight sim community.