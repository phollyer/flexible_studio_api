package api.splash.loadImage
{
	import api.events.splash.loadImage.LoadImageEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Load a new image into the splash screen.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_loadImage.html Northcode Help Documentation
	*/
	public class LoadImage extends Splash
	{
		/**
		* A fully qualified path to an image file or the path to a resource in the layout.
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		/**
		* Constructor for Splash.LoadImage()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_loadImage.html Northcode Help Documentation
		*/
		public function LoadImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Load a new image into the splash screen.
		*
		*
		* @param pathToResource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_loadImage.html Northcode Help Documentation
		*/
		public function loadImage( pathToResource:String = null ):void
		{
			resource = compareStrings( pathToResource , resource );
			switch( resource )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Splash.loadImage( {resource:resource} , {callback:actionComplete, errorSTR:"loadImageError", code:"5001"} );
			}
		}
	}
}