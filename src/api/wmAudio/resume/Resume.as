package api.wmAudio.resume
{
	import api.events.wmAudio.resume.ResumeEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_resume.html Northcode Help Documentation
	*/
	public class Resume extends WmAudio
	{
		/**
		* Constructor for WmAudio.Resume()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_resume.html Northcode Help Documentation
		*/
		public function Resume(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_resume.html Northcode Help Documentation
		*/
		public function resume():void
		{
			ssCore.WmAudio.resume( {}
								  ,{callback:actionComplete, errorSTR:"resumeError", code:"46003"} );
		}
	}
}