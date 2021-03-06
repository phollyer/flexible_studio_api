package api.wmVideo.setZoom
{
	import api.events.wmVideo.setZoom.SetZoomEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the size of the video playback window by specifying a zoom factor. Setting the zoom factor will automatically disable fullscreen mode.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setZoom.html Northcode Help Documentation
	*/
	public class SetZoom extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>100</code>
		*/
		public var zoom:Number = 100;
		
		/**
		* Constructor for WmVideo.SetZoom()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setZoom.html Northcode Help Documentation
		*/
		public function SetZoom(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the size of the video playback window by specifying a zoom factor. Setting the zoom factor will automatically disable fullscreen mode.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setZoom.html Northcode Help Documentation
		*/
		public function setZoom():void
		{
			ssCore.WmVideo.setZoom( {zoom:zoom}
								   ,{callback:actionComplete, errorSTR:"setZoomError", code:"46017"} );
		}
	}
}