package api.wmAudio.setVersion
{
	import api.events.wmAudio.setVersion.SetVersionEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the version of the media player you want to use.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVersion.html Northcode Help Documentation
	*/
	public class SetVersion extends WmAudio
	{
		// Optional 
		/**
		* Desired player version. Valid values include: 6 and 9.
		*
		* @defaultValue <code>9</code>
		*/
		public var version:Number = 9;
		
		/**
		* Constructor for WmAudio.SetVersion()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVersion.html Northcode Help Documentation
		*/
		public function SetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the version of the media player you want to use.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVersion.html Northcode Help Documentation
		*/
		public function setVersion():void
		{
			ssCore.WmAudio.setVersion( {version:version}
									  ,{callback:actionComplete, errorSTR:"setVersionError", code:"46009"} );
		}
	}
}