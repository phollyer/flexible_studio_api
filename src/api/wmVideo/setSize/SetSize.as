package api.wmVideo.setSize
{
	import api.events.wmVideo.setSize.SetSizeEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setSize.html Northcode Help Documentation
	*/
	public class SetSize extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>240</code>
		*/
		public var height:Number = 240
		/**
		* 
		*
		* @defaultValue <code>320</code>
		*/
		public var width:Number = 320;
		
		/**
		* Constructor for WmVideo.SetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setSize.html Northcode Help Documentation
		*/
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setSize.html Northcode Help Documentation
		*/
		public function setSize():void
		{
			ssCore.WmVideo.setSize( {height:height , width:width}
								   ,{callback:actionComplete, errorSTR:"setSizeError", code:"46014"} );
		}
	}
}