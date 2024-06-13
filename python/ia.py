import internetarchive as ia

def upload_podcast(show_title, files, metadata):
    """
    Uploads podcast shows to the Internet Archive.

    :param show_title: Title of the show.
    :param files: List of file paths to upload.
    :param metadata: Dictionary containing metadata for the upload.
    """
    # Create a unique identifier for the item based on the show title
    identifier = show_title.lower().replace(" ", "_")
    
    # Upload files with metadata
    response = ia.upload(identifier, files, metadata=metadata)
    
    # Check the response
    if response[0].status_code == 200:
        print(f"Successfully uploaded {show_title} to the Internet Archive.")
    else:
        print(f"Failed to upload {show_title}. Status code: {response[0].status_code}")

# Example usage
if __name__ == "__main__":
    # Define show title
    show_title = "The Captain Contrary Show - Episode 1"
    
    # Define file paths to upload
    files = ["episode1.mp3", "cover.jpg"]
    
    # Define metadata
    metadata = {
        "title": "The Captain Contrary Show - Episode 1",
        "creator": "Captain Contrary",
        "description": "In this episode, Captain Contrary discusses the latest news and events.",
        "subject": ["podcast", "talk show", "news"],
        "date": "2024-06-12"
    }
    
    # Upload the podcast show
    upload_podcast(show_title, files, metadata)
