package api.wmVideo.resume
{
	import api.events.wmVideo.resume.ResumeEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Resume playback of the current resource after calling WMVideo.pause.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_resume.html Northcode Help Documentation
	*/
	public class Resume extends WmVideo
	{
		/**
		* Constructor for WmVideo.Resume()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_resume.html Northcode Help Documentation
		*/
		public function Resume(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Resume playback of the current resource after calling WMVideo.pause.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_resume.html Northcode Help Documentation
		*/
		public function resume():void
		{
			ssCore.WmVideo.resume( {}
								  ,{callback:actionComplete, errorSTR:"resumeError", code:"46004"} );
		}
	}
}