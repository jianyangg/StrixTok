# fetch videos from firebase storage using the private key stored in strixtok_priv.json

import os
from time import sleep
import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage
import argparse

# def download_video(bucket_name, video_name, output_name):
#     cred = credentials.Certificate('strixtok_priv.json')
#     firebase_admin.initialize_app(cred, {
#         'storageBucket': bucket_name
#     })

#     # append to the video name the directory where the video is stored
#     video_name = 'pendingVideos/' + video_name

#     bucket = storage.bucket()
#     blob = bucket.blob(video_name)
#     blob.download_to_filename(output_name)

#     # delete video from storage
#     blob.delete()

#     print('Video {} downloaded to {}.'.format(
#         video_name,
#         output_name))
    
#     return

def download_and_delete_videos(bucket_name, directory):
    try:
        print("Downloading videos from Firebase Storage...")
        cred = credentials.Certificate('strixtok_priv.json')
        firebase_admin.initialize_app(cred, {
            'storageBucket': bucket_name
        })

        bucket = storage.bucket()
        blobs = bucket.list_blobs(prefix=directory)

        for blob in blobs:
            # Get the video name and remove the directory prefix
            video_name = blob.name[len(directory):]
            
            # Download the video
            output_name = f'videos_testing/downloaded_{video_name}'
            blob.download_to_filename(output_name)
            print(f'Video {video_name} downloaded to {output_name}.')

            # Delete the video from storage but do not delete the directory
            blob = bucket.blob(blob.name)
            blob.delete()
            print(f'Video {video_name} deleted from Firebase Storage.')

        print('All videos downloaded and deleted from Firebase Storage.')

    except Exception as e:
        print(f'Error: {e}')

# Use this function once the video has been reviewed and approved by CV model
def upload_video(bucket_name, directory):
    # loop through the videos in videos_testing directory
    # upload each video to the approvedVideos directory
    try:
        print("Uploading videos to Firebase Storage...")
        # list all videos in videos_testing directory
        videos = os.listdir('videos_testing/')
        # only select videos with .mp4 extension
        videos = [video for video in videos if video.endswith('.mp4')]
        print(f'Videos to upload: {videos}')

        bucket = storage.bucket()
        for video in videos:
            # create a blob object for the video
            blob_name = f'{directory}{video}'
            blob = bucket.blob(blob_name)

            # upload the video to approvedVideos directory
            blob.upload_from_filename(f'videos_testing/{video}')
            print(f'Video {video} uploaded to Firebase Storage.')

            # delete the video from videos_testing directory
            os.remove(f'videos_testing/{video}')
            print(f'Video {video} deleted from videos_testing directory.')

        print("Videos uploaded to Firebase Storage.")


    except Exception as e:
        print(f'Error: {e}')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--bucket', type=str, default='strixtok.appspot.com')
    parser.add_argument('--directory', type=str, default='pendingVideos/')
    # parser.add_argument('--video', type=str, default='test_video.mp4')
    # parser.add_argument('--output', type=str, default='approved_video.mp4')
    args = parser.parse_args()

    download_and_delete_videos(args.bucket, args.directory)

    print("Simulating review process...")
    sleep(3) # this simulates the review process by the CV model
    print("Video approved!")

    upload_video(args.bucket, 'approvedVideos/')
    

if __name__ == '__main__':
    main()

