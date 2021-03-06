package study.spring.goodspring.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import retrofit2.Call;
import retrofit2.Retrofit;
import study.spring.goodspring.APIservice.CasAPISerchService;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.CasAPIList;
import study.spring.goodspring.model.CasAPIList.tvYeyakCOllect.Row;
import study.spring.goodspring.uploadservice.CasAPIUploadService;

@Slf4j
@Controller
public class CasAPIScheduler {
	/** 통신처리에 필요한 객체 주입 **/
	@Autowired
	RetrofitHelper retrofitHelper;

	/** 데이터베이스 연동에 필요한 서비스 객체 주입 **/
	@Autowired
	CasAPIUploadService CasAPIUploadService;

	
	/**
	 * 문화체육 API를 수집하여 DB에 저장하기 위한 메서드
	 */
	@ResponseBody
	@RequestMapping(value = "/cas_totalapi_scheduler", method = RequestMethod.GET)
	public void collectCasOther() {
		/** 1) API 연동 객체 생성 */
		// Retrofit 객체 생성
		Retrofit retrofit = retrofitHelper.getRetrofit(CasAPISerchService.BASE_URL);

		// Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
		CasAPISerchService casApiService = retrofit.create(CasAPISerchService.class);

		/** 2) 검색 파라미터 처리 */
		Call<CasAPIList> call = casApiService.getCasOtherAPIList();
		CasAPIList casAPIList = null;
		try {
			casAPIList = call.execute().body();
		} catch (Exception e) {
			e.printStackTrace();
		}

		/** 3) 조회결과를 반복문을 활용해서 출력 저장. */
		List<Row> list = null;
		if (casAPIList != null) {
			list = casAPIList.getTvYeyakCOllect().getRow();
		} else {
			log.debug("조회결과 없음");
			return;
		}

		/** 5) 수집결과 저장하기 **/
		try {
			CasAPIUploadService.collectCasOther(list);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
}
