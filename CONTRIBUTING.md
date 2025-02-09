# Contributing to Video Downloader

## Project Overview

This is a Windows batch script that automates the process of downloading and processing videos. The script:
- Checks for and installs Python if needed
- Installs yt-dlp for video downloading
- Checks for and installs FFmpeg for video processing
- Handles video downloading with authentication via cookies
- Merges video and audio streams into a single high-quality output

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion, please create an issue with the following information:
1. Clear description of the problem or suggestion
2. Steps to reproduce (for bugs)
3. Expected behavior
4. Actual behavior
5. System information (Windows version, Python version)

### Making Changes

1. Fork the repository
2. Create a new branch for your changes:
```bash
git checkout -b feature/your-feature-name
```
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### Code Style Guidelines

#### Batch Script Conventions
- Use `::` for comments (both English and Turkish)
- Include bilingual messages (Turkish and English)
- Use meaningful variable names
- Add error handling where appropriate
- Keep the code structure organized and modular

#### Testing Requirements
Before submitting changes, ensure:
- The script runs on a clean Windows installation
- Python installation works correctly
- yt-dlp installation succeeds
- FFmpeg installation and setup works
- Video download and processing functions work
- Cookie authentication functions properly

## Development Setup

### Prerequisites
- Windows operating system
- Internet connection
- Administrator privileges

### Local Development
1. Clone the repository
2. Create a `cookies.txt` file for testing
3. Test with various video URLs
4. Verify both video and audio processing

## Pull Request Process

1. Update documentation if needed
2. Test all changes thoroughly
3. Ensure bilingual support is maintained
4. Update version numbers if applicable
5. Submit pull request with clear description of changes

## Code Review Process

All submissions require review. We use GitHub pull requests for this purpose. Consult [GitHub Help](https://help.github.com/articles/about-pull-requests/) for more information on using pull requests.

## Community Guidelines

- Be respectful of other contributors
- Write detailed commit messages
- Document significant changes
- Respond to feedback constructively
- Help others in the community

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the original project.

## Contact

For major changes, please open an issue first to discuss what you would like to change. This ensures your time is spent on changes that are likely to be accepted.

## Acknowledgments

Thanks to all contributors who help improve this video downloader script!
