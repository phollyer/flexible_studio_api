package api.wmVideo.setVersion
{
	import api.events.wmVideo.setVersion.SetVersionEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVersion.html Northcode Help Documentation
	*/
	public class SetVersion extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>9</code>
		*/
		public var version:Number = 9;
		
		/**
		* Constructor for WmVideo.SetVersion()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVersion.html Northcode Help Documentation
		*/
		public function SetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVersion.html Northcode Help Documentation
		*/
		public function setVersion():void
		{
			ssCore.WmVideo.setVersion( {version:version}
									  ,{callback:actionComplete, errorSTR:"setVersionError", code:"46015"} );
		}
	}
}