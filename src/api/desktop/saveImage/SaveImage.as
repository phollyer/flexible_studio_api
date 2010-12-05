package api.desktop.saveImage
{
	import api.desktop.Desktop;

	import api.events.desktop.saveImage.SaveImageEvent;

	import api.vos.desktop.SaveImageVO;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Save a rectangular area of the desktop to disk as a bitmap or Jpeg image.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_saveImage.html Northcode Help Documentation
	*/
	public class SaveImage extends Desktop
	{
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var saveSettings:SaveImageVO = new SaveImageVO();
		
		/**
		* Constructor for Desktop.SaveImage()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_saveImage.html Northcode Help Documentation
		*/
		public function SaveImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Save a rectangular area of the desktop to disk as a bitmap or Jpeg image.
		*
		*
		* @param path
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_saveImage.html Northcode Help Documentation
		*/
		public function saveImage( path:String = null ):void
		{
			saveSettings.path = compareStrings( path , saveSettings.path );
			switch( saveSettings.path )
			{
				case null:
					missingPath();
					break;
				default:
					var __o:Object = saveSettings.getObject();
					ssCore.Desktop.saveImage( __o
											,{callback:actionComplete, errorSTR:"saveImageError", code:"19003"} );
			}
		}
	}
}