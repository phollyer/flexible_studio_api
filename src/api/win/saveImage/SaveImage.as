package api.win.saveImage
{
	import api.events.win.saveImage.SaveImageEvent;

	import api.vos.win.SaveImageVO;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Save a rectangular area of the application window to disk as a bitmap or Jpeg image.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_saveImage.html Northcode Help Documentation
	*/
	public class SaveImage extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:SaveImageVO = new SaveImageVO();
		
		/**
		* Constructor for Win.SaveImage()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_saveImage.html Northcode Help Documentation
		*/
		public function SaveImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Save a rectangular area of the application window to disk as a bitmap or Jpeg image.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_saveImage.html Northcode Help Documentation
		*/
		public function saveImage( filePath:String = null ):void
		{
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Win.saveImage( settings.createObject()
										,{callback:actionComplete, errorSTR:"saveImageError", code:"6015"} );
			}
		}
	}
}