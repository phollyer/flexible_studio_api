package api.wmVideo.setPosition
{
	import api.events.wmVideo.setPosition.SetPositionEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the position of the video playback window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPosition.html Northcode Help Documentation
	*/
	public class SetPosition extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for WmVideo.SetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPosition.html Northcode Help Documentation
		*/
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the position of the video playback window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPosition.html Northcode Help Documentation
		*/
		public function setPosition():void
		{
			ssCore.WmVideo.setPosition( {x:x , y:y}
									   ,{callback:actionComplete, errorSTR:"setPositionError", code:"46011"} );
		}
	}
}