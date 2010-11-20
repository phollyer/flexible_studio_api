package api.wmVideo.setMute
{
	import api.events.wmVideo.setMute.SetMuteEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setMute.html Northcode Help Documentation
	*/
	public class SetMute extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for WmVideo.SetMute()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setMute.html Northcode Help Documentation
		*/
		public function SetMute(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setMute.html Northcode Help Documentation
		*/
		public function setMute():void
		{
			ssCore.WmVideo.setMute( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"setMuteError", code:"46009"} );
		}
	}
}