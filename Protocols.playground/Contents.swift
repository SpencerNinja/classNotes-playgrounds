import AVFoundation

/**
 PROTOCOLS -
 
 Many languages support the concept of protocols AKA interfaces. For Swift, however, they are an intregal part of the design. If you look at Apple's documentation and internal class files, you'll see them used all over. Apple even refers to Swift as a "Protocol Oriented Programming Language".
 
 Protocols enable us to define APIs and requirements without tying them to one specific type or implementation.
 For example, let's say that we are working on a music Player class and we've implemented our playback code as two separate methods within the same Player class. One for playing Songs and another for playing Albums.
 */

class Player {
    
    private let avPlayer = AVPlayer()
    
    func play(_ song: Song) {
        let item = AVPlayerItem(url: song.audioURL)
        avPlayer.replaceCurrentItem(with: item)
        avPlayer.play()
    }
    
    func play(_ album: Album) {
        let item = AVPlayerItem(url: album.audioURL)
        avPlayer.replaceCurrentItem(with: item)
        avPlayer.play()
    }
    
}

/**
 Now we can simplify our player class by merging our two 'play' methods into one that rather than accepting a concrete type(Song, Album), now accepts ANY type with conforms to the Playable protocol.
 */
class SimplePlayer {
    
    private let avPlayer = AVPlayer()
    
    func play(_ resource: Playable) {
        let item = AVPlayerItem(url: resource.audioURL)
        avPlayer.replaceCurrentItem(with: item)
        avPlayer.play()
    }
    
    func stop() {
        avPlayer.pause()
    }
    
}

struct Album: Playable {
    var name: String
    var imageURL: URL
    var audioURL: URL
    var isLiked: Bool
    
    mutating func markAsLiked() {
        isLiked = !isLiked
    }
}

struct Song: Playable {
    var name: String
    var album: Album
    var audioURL: URL
    var isLiked: Bool
    
    mutating func markAsLiked() {
        isLiked = !isLiked
    }
}

protocol Playable {
    var audioURL: URL { get set }
    
    mutating func markAsLiked()
}

let player = SimplePlayer()

let album = Album(
    name: "Blank Album",
    imageURL: URL(string: "someimage.com")!,
    audioURL: URL(string: "somealbum.mp3")!,
    isLiked: false)

let track = Song(
    name: "Euro Beat",
    album: album,
    audioURL: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3")!,
    isLiked: true
)
// https://www.soundhelix.com/audio-examples

player.play(track)
player.stop()

// Can implement functions in Protocols via an extension
extension Playable {
    mutating func markIsLiked() {}
}

// Extensions with protocols
//

/**
 In many ways, it comes down to how the standard libary is designed - which leverages features like protocol extensions to both optimize its own internal implementation, and to enable us to write our own functionality on top of its many protocols using those same extensions.
 */

extension Collection where Element: Numeric {
    func sum() -> Element {
        self.reduce(0, +)
    }
}

let numbers = [1, 2, 3, 4]
numbers.sum()

/**
 What makes protocols especially usefule is both that they enable us to create abstractions that let us hide implementation details behind shared interfaces - which in turn make it easier to share code that uses those interfaces - also they enable us to customize and extend the standard library and its APIs.
 */

/**
 Abstraction is used to hide background details or any unnecessary implementation about the data so that users only see the required information. It is one of the most important and essential features of object-oriented programming. Pre-defined functions are similar to data abstraction.
 */
