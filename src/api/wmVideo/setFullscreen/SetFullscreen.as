package api.wmVideo.setFullscreen
{
	import api.events.wmVideo.setFullscreen.SetFullscreenEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Enable or disable fullscreen video playback.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFullscreen.html Northcode Help Documentation
	*/
	public class SetFullscreen extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for WmVideo.SetFullscreen()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFullscreen.html Northcode Help Documentation
		*/
		public function SetFullscreen(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Enable or disable fullscreen video playback.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFullscreen.html Northcode Help Documentation
		*/
		public function setFullscreen():void
		{
			ssCore.WmVideo.setFullscreen( {flag:flag}
										 ,{callback:actionComplete, errorSTR:"setFullscreenError", code:"46006"} );
		}
	}
}